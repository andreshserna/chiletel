import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReportDamageComponent } from './report-damage.component';

describe('ReportDamageComponent', () => {
  let component: ReportDamageComponent;
  let fixture: ComponentFixture<ReportDamageComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ReportDamageComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ReportDamageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
