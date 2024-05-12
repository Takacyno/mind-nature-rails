module SetImaginationtext
    def set_imaginationtext
        @imaginationtext = Imaginationtext.find(params[:imaginationtext_id])
    end
end