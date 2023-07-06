# hassio-lxp-bridge
lxp-bridge Home Assistant addon


## Installation
1. If you don't have an MQTT broker yet; in Home Assistant go to **[Settings → Add-ons → Add-on store](https://my.home-assistant.io/redirect/supervisor_store/)** and install the **[Mosquitto broker](https://my.home-assistant.io/redirect/supervisor_addon/?addon=core_mosquitto)** addon.
1. Go back to the **Add-on store**, click **⋮ → Repositories**, fill in</br>  `https://github.com/unreadablename/hassio-lxp-bridge/` and click **Add → Close** or click the **Add repository** button below, click **Add → Close** (You might need to enter the **internal IP address** of your Home Assistant instance first).
[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Funreadablename%2Fhassio-lxp-bridge)
3. The repository includes two add-ons:
    - **lxp-bridge** is the stable release that tracks the released versions of **lxp-bridge**. (**recommended for most users**)
    - **lxp-bridge-dev** tracks the `dev` branch of **lxp-bridge** such that you can install the dev version if there are features or fixes in the lxp-bridge dev branch that are not yet released.
4. Click on the addon and press **Install** and wait till the addon is installed.
5. Click on **Configuration**
    - Add your inverter (one or multiple) into **inverters** section. Use default value as guidance
        ```yaml
        - enabled: true
          host: 192.169.0.11
          port: 8000
          serial: 5555555555
          datalog: 2222222222
          heartbeats: false
          publish_holdings_on_connect: false
        ```
    - If you are **not** using the Mosquitto broker addon fill in your MQTT details (leave empty when using the Mosquitto broker addon).
        ```yaml
        host: str?
        port: str?
        username: str?
        password: str?
        publish_individual_input: false
        ```
6. Start the addon by going to **Info** and click **Start**


## Changelog
The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/).

All notable changes to this project will be documented in the [CHANGELOG.md](hassio-lxp-bridge/CHANGELOG.md) file.

Version for releases is based on [lxp-bridge](https://github.com/celsworth/lxp-bridge/) format: `X.Y.Z`.

Any changes on the addon that do not require a new version of Zigbee2MQlxp-bridgeTT will use the format: `X.Y.Z-A` where `X.Y.Z` is fixed on the lxp-bridge release version and `A` is related to the addon.

Edge version will not maintain a CHANGELOG and doesn't have a version.