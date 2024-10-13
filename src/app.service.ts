import { Injectable } from '@nestjs/common';
import { InjectMetric } from "@willsoto/nestjs-prometheus";
import { Counter } from "prom-client";

@Injectable()
export class AppService {
  constructor(@InjectMetric("get_hello_calls") public counter: Counter<string>) {}

  getHello(): string {
    this.counter.inc();
    return 'Hello World!';
  }
}
