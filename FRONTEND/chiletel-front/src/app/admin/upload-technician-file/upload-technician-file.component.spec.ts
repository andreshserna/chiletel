import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UploadTechnicianFileComponent } from './upload-technician-file.component';

describe('UploadTechnicianFileComponent', () => {
  let component: UploadTechnicianFileComponent;
  let fixture: ComponentFixture<UploadTechnicianFileComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UploadTechnicianFileComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UploadTechnicianFileComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
