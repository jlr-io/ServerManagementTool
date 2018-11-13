json.extract! server, :id, :user_id, :approved, :hostname, :location, :environment, :os_requested, :disk_size, :eng_team_sme_contact_id, :eng_team_manager_contact_id, :application_sme_id, :application_team_distro_group, :application_manager_id, :application_director_id, :line_of_business, :virtual_machine, :asset, :created_at, :updated_at
json.url server_url(server, format: :json)
