import { describe, test, expect } from "bun:test";

import { syncDB } from "../../tasks/sync-db";

describe("syncDB", () => {
  test("should execute the process twice", async () => {
    syncDB();
    const times = syncDB();
    expect(times).toBe(2);
  });
});
