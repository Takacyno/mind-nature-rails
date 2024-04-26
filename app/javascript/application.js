// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

function setPatientId(patientId) {
    session[:patient_id] = patientId.to_json ;
}