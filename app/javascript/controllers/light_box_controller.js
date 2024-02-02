import LightBox from 'stimulus-lightbox'

export default class extends LightBox {
  connect() {
    super.connect()
    console.log('Do what you want here.')
  }
} 
