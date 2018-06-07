class PagesController < ApplicationController
  def wedding
    email = params["email"]
    if email.blank?
      @notification = "Vous n'avez pas renseigné votre adresse email. Merci d'utiliser celle sur laquelle vous avez reçu le faire-part."
      render :landing
    else
      if is_invited?(email) && is_invited_to_lunch?(email)
        @user_type = "lunch_invited"
      elsif is_invited?(email)
        @user_type = "diner_invited"
      else
        @user_type = "not_invited"
        @notification = "Nous ne reconnaissons pas votre adresse email, vérifiez que vous utilisez bien l'adresse email sur laquelle vous avez reçu le faire-part. Merci beaucoup !"
        render :landing
      end
    end
  end

  def components
  end

  def landing
  end

  def infos
    @markers = [
      {lat: 47.264302, lng: -2.340186, infoWindow: { content: render_to_string(partial: "/pages/map_box", locals: { lieu: "Mairie" })}},
      {lat: 47.243593, lng: -2.312504, infoWindow: { content: render_to_string(partial: "/pages/map_box", locals: { lieu: "Ker Yette" })}},
      {lat: 47.270689, lng: -2.344823, infoWindow: { content: render_to_string(partial: "/pages/map_box", locals: { lieu: "Gare de Pornichet" })}},
      {lat: 47.286644, lng: -2.210957, infoWindow: { content: render_to_string(partial: "/pages/map_box", locals: { lieu: "Gare de Saint-Nazaire" })}},
      {lat: 47.256408, lng: -2.338274, infoWindow: { content: render_to_string(partial: "/pages/map_box", locals: { lieu: "Hotel du Chateau des Tourelles" })}},
      {lat: 47.248144, lng: -2.311708, infoWindow: { content: render_to_string(partial: "/pages/map_box", locals: { lieu: "Hotel Azureva" })}},
      {lat: 47.238381, lng: -2.279730, infoWindow: { content: render_to_string(partial: "/pages/map_box", locals: { lieu: "Hotel de la Plage Saint Marc" })}},
      {lat: 47.255639, lng: -2.338253, infoWindow: { content: render_to_string(partial: "/pages/map_box", locals: { lieu: "Hotel Le Belouga" })}},
      {lat: 47.260963, lng: -2.339944, infoWindow: { content: render_to_string(partial: "/pages/map_box", locals: { lieu: "Hotel Oceania" })}},
      {lat: 47.265601, lng: -2.344373, infoWindow: { content: render_to_string(partial: "/pages/map_box", locals: { lieu: "Hotel Ibis" })}},
      {lat: 47.250448, lng: -2.321870, infoWindow: { content: render_to_string(partial: "/pages/map_box", locals: { lieu: "Camping Bel air" })}}
    ]
  end

  def answer
    attributes = {
      name: params[:name],
      email: params[:email],
      answer_dejeuner: params[:answer_dejeuner],
      answer_diner: params[:answer_diner],
      answer_brunch: params[:answer_brunch],
      nb_dejeuner: params[:nb_dejeuner],
      nb_diner: params[:nb_diner],
      nb_brunch: params[:nb_brunch]
    }
    answer = Answer.new(attributes)
    if answer.save
      # ici envoyer un email avec les informations
    else
      # ici ajouter du js.erb
    end
    redirect_to wedding_path

  end

  private

  def is_invited?(email)
    load_list
    @lunch_list.include?(email) || @diner_list.include?(email)
  end

  def is_invited_to_lunch?(email)
    load_list
    @lunch_list.include?(email)
  end

  def load_list
    filepath = Rails.root.join('db', 'invitations.yml')
    my_yaml = YAML.load_file(filepath)
    @lunch_list = my_yaml["dejeuner"]
    @diner_list = my_yaml["diner"]
  end
end
