{
  services.home-assistant.config.automation = [
    {
      id = "zone_notify_blanka";
      alias = "Zone notify blanka";
      mode = "parallel";
      max = 10;
      trigger = [
        {
          platform = "zone";
          entity_id = "person.kacper";
          zone = "zone.home";
          event = "enter";
        }
        {
          platform = "zone";
          entity_id = "person.kacper";
          zone = "zone.home";
          event = "leave";
        }
        {
          platform = "zone";
          entity_id = "person.kacper";
          zone = "zone.lublin_university_of_technology";
          event = "enter";
        }
        {
          platform = "zone";
          entity_id = "person.kacper";
          zone = "zone.lublin_university_of_technology";
          event = "leave";
        }
      ];
      condition = [ ];
      action = [
        {
          action = "notify.mobile_app_blanka_iphone";
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
