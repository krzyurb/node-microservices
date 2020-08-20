import { Injectable } from '@nestjs/common';
import { Post } from './interfaces/post.interface';

@Injectable()
export class PostsService {
  getAll(): Post[] {
    return [
      { id: 'A', content: 'Hello world', createdAt: new Date() },
      { id: 'B', content: 'Example', createdAt: new Date() },
    ];
  }
}
