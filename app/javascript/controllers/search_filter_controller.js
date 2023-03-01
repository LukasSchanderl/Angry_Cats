import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-filter"
export default class extends Controller {
  connect() {
    console.log('search-filter controller connected')
  }
}
