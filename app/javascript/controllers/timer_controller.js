import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"
export default class extends Controller {
  static targets = ["timer"];

  connect() {
    this.timer = setInterval(this.timer.bind(this), 1000);
  }

  timer() {
    const zeroFill = n => {
      return ('0' + n).slice(-2);
    }
    const now = new Date();
    const realtime = zeroFill(now.getUTCDate()) + '/' + zeroFill((now.getUTCMonth()+1)) + '/' + now.getFullYear() + ' -> ' 
                     + zeroFill(now.getHours()) + ':' + zeroFill(now.getMinutes()) + ':' + zeroFill(now.getSeconds());

    this.timerTarget.innerHTML = realtime;
  }
}
