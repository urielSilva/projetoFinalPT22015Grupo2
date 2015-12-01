class AddRoleToProjectsUser < ActiveRecord::Migration
  def change
    add_reference :projects_users, :project_role, index: true, foreign_key: true
  end
end
