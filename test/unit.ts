import assert from 'assert';

describe('basic test', () => {
  it('array test', () => {
    const input: number[] = [1, 2, 3, 4, 5];

    assert.strictEqual(
      input.reduce((a, b) => a + b),
      15,
    );
  });
});
