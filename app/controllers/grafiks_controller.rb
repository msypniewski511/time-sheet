class GrafiksController < ApplicationController
    before_action :set_grafiks, only:[:show, :edit, :update, :destroy]
end
