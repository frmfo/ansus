// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import DropdownController from "./dropdown_controller"
application.register("dropdown", DropdownController)

import MasksController from "./masks_controller"
application.register("masks", MasksController)

import RemoteModalController from "./remote_modal_controller"
application.register("remote-modal", RemoteModalController)

import TimerController from "./timer_controller"
application.register("timer", TimerController)
