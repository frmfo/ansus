import $ from 'jquery';
window.$ = window.jQuery = require('jquery');
require("jquery-mask-plugin");

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.maskFields();
  }
  
  maskFields() {
    $('[data-masks-target="phone"]').mask('(00) 00000-0009');
    $('[data-masks-target="cpf"]').mask('000.000.000-00');
    $('[data-masks-target="plate"]').mask('AAA 0U00', {
      translation: {
          'A': {
              pattern: /[A-Za-z]/
          },
          'U': {
              pattern: /[A-Za-z0-9]/
          },
      },
      onKeyPress: function (value, e, field, options) {
          // Convert to uppercase
          e.currentTarget.value = value.toUpperCase();
  
          // Get only valid characters
          let val = value.replace(/[^\w]/g, '');
  
          // Detect plate format
          let isNumeric = !isNaN(parseFloat(val[4])) && isFinite(val[4]);
          let mask = 'AAA 0U00';
          if(val.length > 4 && isNumeric) {
              mask = 'AAA-0000';
          }
          $(field).mask(mask, options);
      }
    });
    $('[data-masks-target="cpfcnpj"]').mask('000.000.000-00', {
      onKeyPress : function(cpfcnpj, e, field, options) {
        const masks = ['000.000.000-000', '00.000.000/0000-00'];
        const mask = (cpfcnpj.length > 14) ? masks[1] : masks[0];
        $(field).mask(mask, options);
      }
    });
  }
}