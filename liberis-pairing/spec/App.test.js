const wordleStringComparator = require("../src/app");

describe("Block 1: dummyFunction with exact match 2", () => {
  it("wordleStringComparator returns a single 2 on first char", () => {
    expect(wordleStringComparator("watch", "words")[0]).toBe("2");
  });

  it("wordleStringComparator does not return 2 on first char if no match", () => {
    expect(wordleStringComparator("batch", "words")[0]).toBe("0");
  });

  it("wordleStringComparator returns a single 2 on 2nd char", () => {
    expect(wordleStringComparator("batch", "wards")[1]).toBe("2");
  });

  it("wordleStringComparator does not returns a single 2 on 2nd char if no match", () => {
    expect(wordleStringComparator("batch", "words")[1]).toBe("0");
  });

  it("wordleStringComparator returns whole string 2 match", () => {
    expect(wordleStringComparator("baths", "wards")).toBe("02002");
  });
});

describe("block2: returns 1 for partial matching", () => {
  it("wordleStringComparator returns 1 on first partial match", () => {
    expect(wordleStringComparator("hairy", "charm")[1]).toBe("1");
  });
  it("wordleStringComparator returns full 1 and 2 match without repeated letters", () => {
    expect(wordleStringComparator("hairy", "charm")).toBe("01120");
  });
  it("wordleStringComparator returns full 1 and 2 match without repeated letters", () => {
    expect(wordleStringComparator("readt", "elect")).toBe("10002");
  });
  it("wordleStringComparator returns full 1 and 2 match without repeated letters", () => {
    expect(wordleStringComparator("roars", "error")).toBe("01110");
  });
});
