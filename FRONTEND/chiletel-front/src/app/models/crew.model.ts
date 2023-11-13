export class Crew {
  crewId: number;
  name: string;
  zone: string;

  constructor(crewId: number, name: string, zone: string) {
    this.crewId = crewId;
    this.name = name;
    this.zone = zone;
  }
}
