import { Module } from '@nestjs/common';
import { PostsController } from './posts/posts.controller';
import { PostsService } from './posts/posts.service';
import { HealthController } from './health/health.controller';

@Module({
  imports: [],
  controllers: [HealthController, PostsController],
  providers: [PostsService],
})
export class AppModule {}
