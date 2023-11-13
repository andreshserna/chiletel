import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateManualScheduleComponent } from './create-manual-schedule.component';

describe('CreateManualScheduleComponent', () => {
  let component: CreateManualScheduleComponent;
  let fixture: ComponentFixture<CreateManualScheduleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CreateManualScheduleComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CreateManualScheduleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
