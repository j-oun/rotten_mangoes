class Admin::Users::IndexController < ApplicationController
  before_filter :restrict_admin
end