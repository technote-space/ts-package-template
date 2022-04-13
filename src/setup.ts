import { vi } from 'vitest';

vi.mock('./src/constant', () => Object.assign(vi.importActual('./src/constant'), {
  INTERVAL_MS: 0,
}));