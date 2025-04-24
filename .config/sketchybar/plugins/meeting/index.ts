import { format, isBefore } from "date-fns";

type nextEvent = {
  title: string;
  start: string;
  end: string;
  link: string;
};
const proc = Bun.spawn(["shortcuts", "run", "Get Nearest Event Details"]);
const nextEvent: nextEvent = await new Response(proc.stdout).json();
const now = new Date();

const WHITE = "0xffffffff";
const FLAMINGO = "0xFFf2cdcd"; // #f2cdcd
const BASE = "0xe61e1e2e"; // #1e1e2e
const SURFACE = "0xff45475a"; // #313244

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
    `label=${nextEvent.title.slice(0, 60)}`,
    `icon=${format(nextEvent.start, "HH'h'mm")}`,
    "icon.background.height=26",
    `icon.background.color=${FLAMINGO}`,
    "icon.font.size=14.0",
    "icon.padding_right=4",
    "icon.padding_left=8",
    `icon.color=${BASE}`,
    "icon.background.corner_radius=1",
    "label.background.corner_radius=2",
    "label.background.height=24",
    "label.padding_left=8",
    "label.padding_right=8",
    `label.background.color=${SURFACE}`,
    `label.color=${WHITE}`,
    `click_script=open ${nextEvent.link}`,
  ]);
} else {
  Bun.spawn([
    "sketchybar",
    "--set",
    "meeting",
    "label.drawing=on",
    "icon.drawing=off",
    `label=${nextEvent.title.slice(0, 60)}`,
    "label.padding_left=8",
    "label.color=0xe61e1e2e",
    "label.background.color=0xFFf2cdcd",
    "label.background.height=24",
    "label.background.corner_radius=4",
    "label.font.size=14.0",
    `click_script=open ${nextEvent.link}`,
  ]);
}
