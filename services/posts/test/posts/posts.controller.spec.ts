import { Test, TestingModule } from '@nestjs/testing';

import { PostsController } from '../../src/posts/posts.controller';
import { PostsService } from '../../src/posts/posts.service';

describe('AppController', () => {
  let appController: PostsController;

  beforeEach(async () => {
    const app: TestingModule = await Test.createTestingModule({
      controllers: [PostsController],
      providers: [PostsService],
    }).compile();

    appController = app.get<PostsController>(PostsController);
  });

  describe('root', () => {
    it('should return "Hello World!"', () => {
      expect(appController.getAll()).toBe('Hello World!');
    });
  });
});
