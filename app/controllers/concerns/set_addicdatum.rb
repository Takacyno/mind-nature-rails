module SetAddicdatum
    def set_addicdatum_addic
        @addicdatum = Addicdatum.find(params[:addicdatum_id])
    end
end