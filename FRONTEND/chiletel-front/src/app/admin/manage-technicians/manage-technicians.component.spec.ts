import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageTechniciansComponent } from './manage-technicians.component';

describe('ManageTechniciansComponent', () => {
  let component: ManageTechniciansComponent;
  let fixture: ComponentFixture<ManageTechniciansComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageTechniciansComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageTechniciansComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
