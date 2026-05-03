# Dotfiles
Various config files. My current main driver is Fedora Minimal w/ Sway.

## Shell Scripts

The `bin/` directory contains small helper scripts used by the Sway configuration and status bar. Each script is meant to be runnable from the dotfiles tree (or installed in your `PATH`). Make them executable if needed: `chmod +x bin/*.sh`.

### `changeBrightness.sh`
Adjusts the screen backlight via `brightnessctl` and shows a desktop notification with the current percentage. The script forwards all arguments to `brightnessctl` (for example: `set 10%`, `set +5%`, `set 50%`).

Usage example:

```
bin/changeBrightness.sh set +10%
```

Requires: `brightnessctl`, `notify-send`.

### `changeVolume.sh`
Controls the default audio sink using `pactl`. Pass `toggle` to toggle mute (e.g. `bin/changeVolume.sh toggle`) or a volume argument such as `+5%`, `-5%`, or `50%` to set relative/absolute volume. After changing the volume the script queries the sink for the current volume and muted state and displays a notification with the resulting level.

Usage examples:

```
bin/changeVolume.sh toggle
bin/changeVolume.sh +5%
bin/changeVolume.sh 50%
```

Requires: `pactl`, `notify-send`.

### `get_weather.sh`
Fetches a short one-line weather report and a richer tooltip from `wttr.in` using `curl`. The script retries up to 3 times on network failure and prints a small JSON-like object to stdout in the form `{"text":"...", "tooltip":"..."}`, suitable for status bars that consume JSON or simple stdout output.

Usage:

```
bin/get_weather.sh <location>
# example: bin/get_weather.sh London
```

Requires: `curl`.

### `screenshot.sh`
Take a user-selected screenshot on Wayland using `slurp` + `grim`, open it in `swappy` for optional editing, copy the final image to the clipboard with `wl-copy`, and save it under `~/screenshots` with a timestamped filename. A notification is shown when the save is complete.

Usage:

```
bin/screenshot.sh
```

Requires: `grim`, `slurp`, `swappy`, `wl-copy`, `notify-send`.

Notes:

- These scripts are written for a Wayland/Sway environment; some commands are Wayland-specific.
- `pactl` works with both PulseAudio and PipeWire (with `pipewire-pulse`).

## Requirements

These scripts expect the following user-space tools to be installed:

- `brightnessctl` (controls backlight)
- `pactl` (PulseAudio / PipeWire client for volume control)
- `curl` (used by `get_weather.sh`)
- `grim`, `slurp`, `swappy`, `wl-copy` (Wayland screenshot & edit tools used by `screenshot.sh`)
- `notify-send` (desktop notifications, provided by `libnotify` / `libnotify-bin`)

### Sway (Wayland)

These dotfiles include a Sway configuration that starts `mako` (see `.config/sway/config`). `mako` is used here but you can use any notification-daemon in its stead. The provided scripts (`changeBrightness.sh`, `changeVolume.sh`, `screenshot.sh`) assume a Wayland environment and the Wayland utilities listed above (`grim`, `slurp`, `swappy`, `wl-copy`) as well as `pactl` for audio control.