/* eslint-disable no-magic-numbers */
import { describe, expect, it, vi } from 'vitest';
import { add, repeat } from '../src';

describe('add', () => {
  it('should add number', () => {
    expect(add(1, 2)).toBe(3);
  });
});

describe('repeat', () => {
  it('should not call callback', async() => {
    const callback = vi.fn();

    await repeat(callback, 0);

    expect(callback).not.toBeCalled();
  });

  it('should call callback 3 times', async() => {
    const callback = vi.fn();

    await repeat(callback, 3);

    expect(callback).toBeCalledTimes(3);
  });
});
