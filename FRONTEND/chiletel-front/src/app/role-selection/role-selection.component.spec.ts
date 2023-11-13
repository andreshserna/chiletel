import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RoleSelectionComponent } from './role-selection.component';

describe('RoleSelectionComponent', () => {
  let component: RoleSelectionComponent;
  let fixture: ComponentFixture<RoleSelectionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RoleSelectionComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RoleSelectionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
