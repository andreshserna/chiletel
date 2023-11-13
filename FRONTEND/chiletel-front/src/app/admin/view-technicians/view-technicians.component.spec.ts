import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewTechniciansComponent } from './view-technicians.component';

describe('ViewTechniciansComponent', () => {
  let component: ViewTechniciansComponent;
  let fixture: ComponentFixture<ViewTechniciansComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ViewTechniciansComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ViewTechniciansComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
