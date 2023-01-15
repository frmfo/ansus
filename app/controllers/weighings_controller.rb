require "prawn"

class WeighingsController < ApplicationController
  before_action :set_weighing, only: %i[ show edit update destroy ]

  # GET /weighings or /weighings.json
  def index
    if current_user.admin?
      @pagy, @weighings = pagy(Weighing.includes(:costcenter, :employee, :vehicle).order(costcenter_id: :asc, dia: :desc, hora: :desc), items: 14)

    else
      @pagy, @weighings = pagy(Weighing.includes(:costcenter, :employee, :vehicle).where(user_id: current_user.id ).order(dia: :desc, hora: :desc), items: 14)

    end

  end

  # GET /weighings/1 or /weighings/1.json
  def show
    authorize @weighing
  end

  def find_by_period
   @weighings = Weighing.includes(:costcenter, :employee, :vehicle).where("branch_id = :branch_id AND costcenter_id = :costcenter_id AND dia BETWEEN :initial_date AND :final_date",
                  { branch_id: params[:branch_id], costcenter_id: params[:costcenter_id], 
                    initial_date: params[:initial_date], final_date: params[:final_date] })
                    .order(costcenter_id: :asc, dia: :asc)
  end

  def period_report_unit
    @pesagens = Weighing.includes(:costcenter, :employee, :vehicle).where("branch_id = :branch_id AND costcenter_id = :costcenter_id AND dia BETWEEN :initial_date AND :final_date",
                 { branch_id: params[:branch_id], costcenter_id: params[:costcenter_id], 
                 initial_date: params[:initial_date], final_date: params[:final_date] })
                 .order(costcenter_id: :asc, dia: :asc)
    @unit = Branch.find(params[:branch_id])
    @ctc = Costcenter.find(params[:costcenter_id])

    pdf = Prawn::Document.new(:page_size => "A4", :page_layout => :landscape)
    pdf.text "Ansus Serviços Ltda."
    pdf.text "Relatório da Unidade: #{@unit.name} / Centro de Custo: #{@ctc.name}"
    pdf.text "Período selecionado: #{params[:initial_date]} a #{params[:final_date]}"
    pdf.stroke_horizontal_rule
    pdf.move_down 5
      table_data = Array.new
      table_data << ["ID", "Serviço","Placa","Motorista","Data","Hora","Nº Cupom","Peso Entrada", 
                   "Peso Saída","Peso Líquido"]
      weight_total = 0
      @pesagens.each do |p|
          if p.weight_in <= p.weight_out
             weight = p.weight_out - p.weight_in
          else
            weight = p.weight_in - p.weight_out
          end
          weight_total = weight_total + weight
          table_data << [p.id,p.costcenter.service.name,p.vehicle.plate,p.employee.name,p.dia.strftime("%d/%m/%Y"),
                         p.hora.strftime("%H:%M"),p.numbercupom,p.weight_in.to_s.gsub('.', ','),p.weight_out.to_s.gsub('.', ','), weight.to_s.gsub('.', ',')]
      end
      table_data << ['','','','','','','','',"Peso Total:", weight_total.to_s.gsub('.', ',')]
    pdf.table(table_data, :width => 770, :cell_style => { inline_format: true }, header: true)
                  
    pdf.number_pages "Gerado em #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página <page> de <total> ", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 180, 7], :align => :right, :size => 8
    
    send_data pdf.render, filename: "#{@unit.name}_#{@ctc.name}_#{(Time.now).strftime("%d-%m-%y_%H-%M")}.pdf",
                          type: 'application/pdf',
                          disposition: 'inline'

  end


  # GET /weighings/new
  def new
    @weighing = Weighing.new
    authorize @weighing
  end

  # GET /weighings/1/edit
  def edit
    authorize @weighing
  end

  # POST /weighings or /weighings.json
  def create
    @weighing = Weighing.new(weighing_params)
    authorize @weighing

    respond_to do |format|
      if @weighing.save
        format.html { redirect_to weighing_url(@weighing), notice: "Weighing was successfully created." }
        format.json { render :show, status: :created, location: @weighing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weighing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weighings/1 or /weighings/1.json
  def update
    respond_to do |format|
      if @weighing.update(weighing_params)
        authorize @weighing
        format.html { redirect_to weighing_url(@weighing), notice: "Weighing was successfully updated." }
        format.json { render :show, status: :ok, location: @weighing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @weighing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weighings/1 or /weighings/1.json
  def destroy
    @weighing.destroy
    authorize @weighing

    respond_to do |format|
      format.html { redirect_to weighings_url, notice: "Weighing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weighing
      @weighing = Weighing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def weighing_params
      params.require(:weighing).permit(:user_id, :branch_id, :costcenter_id, :destino, :employee_id, :vehicle_id, :dia, :hora, :numbercupom, :weight_in, :weight_out, :coupon)
    end
end
