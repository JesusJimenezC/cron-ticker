import cron from "node-cron";
import { syncDB } from "./tasks/sync-db.ts";

cron.schedule("1-59/5 * * * * *", syncDB);
