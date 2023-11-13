import { Customer } from '../src/app/models/customer.model';

describe('Customer', () => {
  it('should create an instance', () => {
    expect(new Customer()).toBeTruthy();
  });
});
