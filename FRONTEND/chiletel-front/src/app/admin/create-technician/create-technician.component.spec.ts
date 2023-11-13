import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateTechnicianComponent } from './create-technician.component';

describe('CreateTechnicianComponent', () => {
  let component: CreateTechnicianComponent;
  let fixture: ComponentFixture<CreateTechnicianComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CreateTechnicianComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CreateTechnicianComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
