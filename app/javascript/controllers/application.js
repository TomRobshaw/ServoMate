import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// Register external stimulus controllers
import Dropdown from 'stimulus-dropdown'
application.register('dropdown', Dropdown)

import { Modal } from "tailwindcss-stimulus-components"
application.register('modal', Modal)

export { application }
