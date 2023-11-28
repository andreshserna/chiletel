import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AssignTechComponent } from './assign-tech.component';

describe('AssignTechComponent', () => {
  let component: AssignTechComponent;
  let fixture: ComponentFixture<AssignTechComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AssignTechComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AssignTechComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
