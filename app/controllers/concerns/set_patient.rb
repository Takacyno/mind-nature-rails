module SetPatient
    def set_patient_addic
        @patient = Patient.find(params[:patient_id])
    end
end