_: {
  services.home-assistant.config.template = [
    {
      binary_sensor = [
        {
          name = "TV source is jellyfin";
          unique_id = "lg_b5_oled_source_jellyfin";
          state = "{{ is_state_attr('media_player.lg_b5_oled', 'source', 'Jellyfin') }}";
        }
      ];
    }
  ];
}
