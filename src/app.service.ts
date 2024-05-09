import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return `Hello World! PID: ${process.pid} | PORT: ${process.env.APP_PORT}`;
  }
}
