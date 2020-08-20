import { Controller, Get } from '@nestjs/common';
import { PostsService } from './posts.service';
import { Post } from './interfaces/post.interface';

@Controller('posts')
export class PostsController {
  constructor(private readonly postsService: PostsService) {}

  @Get()
  getAll(): Post[] {
    return this.postsService.getAll();
  }
}
