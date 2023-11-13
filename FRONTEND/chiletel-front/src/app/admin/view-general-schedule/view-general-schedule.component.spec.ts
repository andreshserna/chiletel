import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewGeneralScheduleComponent } from './view-general-schedule.component';

describe('ViewGeneralScheduleComponent', () => {
  let component: ViewGeneralScheduleComponent;
  let fixture: ComponentFixture<ViewGeneralScheduleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ViewGeneralScheduleComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ViewGeneralScheduleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
