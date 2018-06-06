class PagesController < ApplicationController
  def home
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
end
