import { describe, expect, it } from 'vitest';
import { WAIT_MS, INTERVAL_MS } from './constant';

describe('INTERVAL_MS', () => {
  it('should return actual value', () => {
    expect(INTERVAL_MS).toBe(1000);
  });
});

describe('WAIT_MS', () => {
  it('should return mocked value', () => {
    expect(WAIT_MS).toBe(0);
  });
});
