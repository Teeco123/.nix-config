{ lib, ... }:
let
  trackedZones = [
    {
      person = "person.blanka";
      zone = "zone.home";
    }
    {
      person = "person.blanka";
      zone = "zone.neuropsychiatric_hospital";
    }
    {
      person = "person.blanka";
      zone = "zone.find_beauty";
    }
    {
      person = "person.blanka";
      zone = "zone.prawiedniki_197b";
    }
    {
      person = "person.blanka";
      zone = "zone.herbowa_8";
    }
    {
      person = "person.eryk";
      zone = "zone.home";
    }
    {
      person = "person.leszek";
      zone = "zone.home";
    }
    {
      person = "person.leszek";
      zone = "zone.kolano_105";
    }
    {
      person = "person.wioleta";
      zone = "zone.home";
    }
  ];
  makeTriggers =
    {
      person,
      zone,
      events ? [
        "enter"
        "leave"
      ],
    }:
    map (event: {
      platform = "zone";
      entity_id = person;
      inherit zone event;
    }) events;
in
{
  services.home-assistant.config.automation = [
    {
      id = "zone_notify_kacper";
      alias = "Zone notify kacper";
      mode = "parallel";
      max = 10;
      trigger = lib.concatMap makeTriggers trackedZones;
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
