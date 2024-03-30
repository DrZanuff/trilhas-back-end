// import { ERROR_LIST } from '@/constants/erros'
import { ITeacherRepository } from '@/repositories/teachers.repository.types'
import { hash } from 'bcryptjs'

type RegisterTeacherProps = {
  name: string
  email: string
  password: string
}

export class RegisterTeacherUseCase {
  constructor(private teacherRepository: ITeacherRepository) {}

  async execute({ email, name, password }: RegisterTeacherProps) {
    const password_hash = await hash(password, 6)

    // TODO - implement findByUniqueEmail so we can't create a user with same email

    const teacher = await this.teacherRepository.create({
      email,
      password_hash,
      teacher_name: name,
    })

    return { teacher }
  }
}
