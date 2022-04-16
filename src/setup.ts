import { vi } from 'vitest';

vi.mock('./constant', async() => ({
  ...await vi.importActual<{ INTERVAL_MS: number }>('./constant'),
  WAIT_MS: 0,
}));
