import { Controller } from "@hotwired/stimulus"
import 'tom-select'
import TomSelect      from "tom-select"

// Connects to data-controller="ts--select"
export default class extends Controller {
  connect() {
    console.log('tom_select_controller connected')
    const selectInput = document.getElementById('select-suitabilities')
    if (selectInput) {
      new TomSelect(selectInput, {
        plugins: {
          remove_button:{
            title:'Remove this item',
          }
        },
        // onItemAdd:function(){
        //   this.setTextboxValue('');
        //   this.refreshOptions();
        // },
        // persist: false,
        // create: function(input, callback) {
        //   const data = { name: input }
        //   const token = document.querySelector('meta[name="csrf-token"]').content
        //   fetch('/tags', {
        //     method: 'POST',
        //     headers:  {
        //       "X-CSRF-Token": token,
        //       "Content-Type": "application/json",
        //       "Accept": "application/json"
        //     },
        //     body: JSON.stringify(data)
        //   })
        //   .then((response) => {
        //     return response.json();
        //   })
        //   .then((data) => {
        //     callback({value: data.id, text: data.name })
        //   });
        // }
      })
    }
  }
}