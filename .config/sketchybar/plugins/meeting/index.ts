import { format, isBefore } from "date-fns";

type nextEvent = {
  title: string;
  start: string;
  end: string;
};
const proc = Bun.spawn(["shortcuts", "run", "Get Nearest Event Details"]);
const nextEvent: nextEvent = await new Response(proc.stdout).json();
const now = new Date();

const WHITE = "0xffffffff";
const ROSEWATER = "0xFFf5e0dc"; // #f5e0dc
const FLAMINGO = "0xFFf2cdcd"; // #f2cdcd
const PINK = "0xFFf5c2e7"; // #f5c2e7
const MAUVE = "0xFFcba6f7"; // #cba6f7
const RED = "0xFFf38ba8"; // #f38ba8
const MAROON = "0xFFeba0ac"; // #eba0ac
const PEACH = "0xFFfab387"; // #fab387
const YELLOW = "0xFFf9e2af"; // #f9e2af
const GREEN = "0xFFa6e3a1"; // #a6e3a1
const TEAL = "0xFF94e2d5"; // #94e2d5
const SKY = "0xFF89dceb"; // #89dceb
const SAPPHIRE = "0xFF74c7ec"; // #74c7ec
const BLUE = "0xFF89b4fa"; // #89b4fa
const LAVENDER = "0xFFb4befe"; // #b4befe
const BASE = "0xe61e1e2e"; // #1e1e2e
const SURFACE = "0xff45475a"; // #313244
const ITEM_BG_COLOR = "1xff2b1c84";

if (nextEvent.title === "") {
  Bun.spawn([
    "sketchybar",
    "--set",
    "meeting",
    "label.drawing=off",
    "icon.drawing=off",
  ]);
} else if (isBefore(now, nextEvent.start)) {
  Bun.spawn([
    "sketchybar",
    "--set",
    "meeting",
    "label.drawing=on",
    "icon.drawing=on",
    `label=${nextEvent.title}`,
    `icon=${format(nextEvent.start, "HH'h'mm")}`,
    "icon.background.height=26",
    `icon.background.color=${FLAMINGO}`,
    "icon.font.size=14.0",
    "icon.padding_right=4",
    "icon.padding_left=6",
    `icon.color=${BASE}`,
    "icon.background.corner_radius=1",
    "label.background.corner_radius=2",
    "label.padding_left=8",
    "label.padding_right=8",
    `label.background.color=${SURFACE}`,
    `label.color=${WHITE}`,
  ]);
} else {
  Bun.spawn([
    "sketchybar",
    "--set",
    "meeting",
    "label.drawing=on",
    "icon.drawing=off",
    `label=${nextEvent.title}`,
    "label.padding_left=8",
    "label.color=0xe61e1e2e",
    "label.background.color=0xFFf2cdcd",
    "label.background.height=24",
    "label.background.corner_radius=4",
    "label.font.size=14.0",
  ]);
}

