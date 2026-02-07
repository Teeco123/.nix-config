{
  services.home-assistant.config.automation = [
    {
      id = "shopping_notify_blanka";
      alias = "Blanka mealie shopping list";
      mode = "single";
      trigger = [
        {
          platform = "zone";
          entity_id = "person.blanka";
          zone = "zone.biedronka";
          event = "enter";
        }
      ];
      condition = [ ];
      action = [
        {
          action = "todo.get_items";
          target = {
            entity_id = [ "todo.mealie_blanka_shopping" ];
          };
          data = {
            status = "needs_action";
          };
          response_variable = "mealie_shop";
        }
        {
          action = "notify.mobile_app_blanka_iphone";
          data = {
            title = "Shopping list";
            message = ''
              {% set tasks = mealie_shop['todo.mealie_blanka_shopping']['items'] %}
              {% if tasks | count > 0 %}
                You need to buy:
                {% for item in tasks %}
                - {{ item.summary }}
                {% endfor %}
              {% else %}
                Your shopping list is empty!
              {% endif %}
            '';
            data = {
              push = {
                interruption-level = "time-critical";
              };
              url = "/todo?entity_id=todo.mealie_blanka_shopping";
              clickAction = "/todo?entity_id=todo.mealie_blanka_shopping";
            };
          };
        }
      ];
    }
  ];
}
