module SetFuneventAbstract
    def set_funevent_abstract
        @funeventabstract = Funeventabstract.find(params[:funeventabstract_id])
    end
end