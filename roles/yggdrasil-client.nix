{ config, lib, ... }:

let cfg = config.my.roles.yggdrasil-client;
in {
  options.my.roles.yggdrasil-client.enable =
    lib.mkEnableOption "Enable yggdrasil";
  config = lib.mkIf (cfg.enable) {
    services.yggdrasil = {
      enable = true;
      persistentKeys = true;
      settings = {
        Peers = [
          # TODO: Maybe add more peers, not only mine. But for now it's ok
          "tls://ygg.iva.bz:50002"
        ];
      };
    };
  };
}
