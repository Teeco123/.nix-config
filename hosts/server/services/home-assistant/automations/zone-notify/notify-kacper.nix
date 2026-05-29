{
  services.home-assistant.config.automation = [
    {
      id = "zone_notify_kacper";
      alias = "Zone notify kacper";
      mode = "parallel";
      max = 10;
      trigger = [
        {
          platform = "zone";
          entity_id = "person.blanka";
          zone = "zone.home";
          event = "enter";
        }
        {
          platform = "zone";
          entity_id = "person.blanka";
          zone = "zone.home";
          event = "leave";
        }
        {
          platform = "zone";
          entity_id = "person.blanka";
          zone = "zone.blanka_psychologist";
          event = "enter";
        }
        {
          platform = "zone";
          entity_id = "person.blanka";
          zone = "zone.blanka_psychologist";
          event = "leave";
        }
        {
          platform = "zone";
          entity_id = "person.leszek";
          zone = "zone.kolano_105";
          event = "enter";
        }
        {
          platform = "zone";
          entity_id = "person.leszek";
          zone = "zone.kolano_105";
          event = "leave";
        }
        {
          platform = "zone";
          entity_id = "person.eryk";
          zone = "zone.home";
          event = "enter";
        }
      ];
      condition = [ ];
      action = [
        {
          action = "notify.mobile_app_kacper_iphone";
          data = {
            title = "Location Update";
            message = ''
              {% if (trigger.event) == "leave" %}
                {{ trigger.to_state.attributes.friendly_name }} left {{ trigger.zone.attributes.friendly_name }}
              {% else %}
                {{ trigger.to_state.attributes.friendly_name }} arrived at {{ trigger.zone.attributes.friendly_name }}
              {% endif %}
            '';
            data = {
              push = {
                interruption-level = "time-sensitive";
              };
            };
          };
        }
      ];
    }
  ];
}
