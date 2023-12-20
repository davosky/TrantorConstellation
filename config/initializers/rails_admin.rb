RailsAdmin.config do |config|
  config.asset_source = :sprockets

  config.authorize_with do
    redirect_to main_app.root_path unless current_operator.admin == true
  end

  config.main_app_name = ["Trantor Constellation"]

  config.model "Operator" do
    visible true
    label "Operatore"
    label_plural "Operatori"
  end

  config.model "Category" do
    visible true
    label "Categoria"
    label_plural "Categorie"
  end

  config.model "Institute" do
    visible true
    label "Istituto"
    label_plural "Istituti"
  end

  config.model "Office" do
    visible true
    label "Ufficio"
    label_plural "Uffici"
  end

  config.model "Province" do
    visible true
    label "Provincia"
    label_plural "Province"
  end

  config.model "Region" do
    visible true
    label "Regione"
    label_plural "Regioni"
  end

  config.model "Veichle" do
    visible true
    label "Veicolo"
    label_plural "Veicoli"
  end

  config.model "Transport" do
    visible true
    label "Trasporto"
    label_plural "Trasporti"
  end

  config.model "MissionPath" do
    visible true
    label "Percorso Missione "
    label_plural "Percorsi Missione"
  end

  config.model "MissionReason" do
    visible true
    label "Motivo Missione "
    label_plural "Motivi Missione"
  end

  config.model "MissionPlace" do
    visible true
    label "Luogo Missione "
    label_plural "Luoghi Missione"
  end

  config.model "MissionStructure" do
    visible true
    label "Struttura Missione"
    label_plural "Strutture Missione"
  end

  config.model "Reimbursement" do
    visible true
    label "Rimborso"
    label_plural "Rimborsi"
  end

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :operator
  # end
  # config.current_operator_method(&:current_operator)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  config.show_gravatar = false

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
